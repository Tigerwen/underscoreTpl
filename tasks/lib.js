/**
 * Created by wenxiang.hu on 15/9/11.
 */
var _ = require('underscore'),
    fs = require('fs');

var noMatch = /(.)^/;

// Certain characters need to be escaped so that they can be put into a
// string literal.
var escapes = {
    "'": "'",
    '\\': '\\',
    '\r': 'r',
    '\n': 'n',
    '\u2028': 'u2028',
    '\u2029': 'u2029'
};
var escapeRegExp = /\\|'|\r|\n|\u2028|\u2029/g;

var escapeChar = function(match) {
    return '\\' + escapes[match];
};
function templates(text, settings, oldSettings) {
    if (!settings && oldSettings) settings = oldSettings;
    settings = _.defaults({}, settings, _.templateSettings);

    // Combine delimiters into one regular expression via alternation.
    var matcher = RegExp([
            (settings.escape || noMatch).source,
            (settings.interpolate || noMatch).source,
            (settings.evaluate || noMatch).source
        ].join('|') + '|$', 'g');

    // Compile the template source, escaping string literals appropriately.
    var index = 0;
    var source = "__p+='";
    text && text.replace(matcher, function (match, escape, interpolate, evaluate, offset) {
        source += text.slice(index, offset).replace(escapeRegExp, escapeChar);
        index = offset + match.length;

        if (escape) {
            source += "'+\n((__t=(" + escape + "))==null?'':_.escape(__t))+\n'";
        } else if (interpolate) {
            source += "'+\n((__t=(" + interpolate + "))==null?'':__t)+\n'";
        } else if (evaluate) {
            source += "';\n" + evaluate + "\n__p+='";
        }

        // Adobe VMs need the match returned to produce the correct offset.
        return match;
    });
    source += "';\n";

    // If a variable is not specified, place data values in local scope.
    if (!settings.variable) source = 'with(obj||{}){\n' + source + '}\n';

    source = "var __t,__p='',__j=Array.prototype.join," +
        "print=function(){__p+=__j.call(arguments,'');};\n" +
        source + 'return __p;\n';

    return source;
};

function scanFolder(path) {
    var fileTree = {},
        walk = function(path, fileTree) {
            files = fs.readdirSync(path);
            files.forEach(function(item) {
                var tmpPath = path + '/' + item,
                    stats = fs.statSync(tmpPath);

                fileTree.basePath = fileTree.basePath || path;
                if (stats.isDirectory()) {
                    fileTree[item] = {};
                    fileTree.hasChildFolder = true;
                    fileTree[item].baseName = item;
                    fileTree.folderList = fileTree.folderList || [];
                    fileTree.folderList.push(item);
                    walk(tmpPath, fileTree[item]);
                } else {
                    fileTree.fileList = fileTree.fileList || [];
                    fileTree.fileList.push(tmpPath);
                }
            });
        };

    walk(path, fileTree);
    return fileTree;
};
module.exports = {
    template: templates,
    scanFolder: scanFolder
};