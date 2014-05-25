(function($) {

    $.fn.caret = function(pos) {

        var target = this[0];
        var isContentEditable = target.contentEditable === 'true';

        if (arguments.length == 0) {

            if (window.getSelection) {

                if (isContentEditable) {
                    target.focus();
                    var range1 = window.getSelection().getRangeAt(0),
                        range2 = range1.cloneRange();
                    range2.selectNodeContents(target);
                    range2.setEnd(range1.endContainer, range1.endOffset);
                    return range2.toString().length;
                }

                return target.selectionStart;
            }

            if (document.selection) {
                target.focus();

                if (isContentEditable) {
                    var range1 = document.selection.createRange(),
                        range2 = document.body.createTextRange();
                    range2.moveToElementText(target);
                    range2.setEndPoint('EndToEnd', range1);
                    return range2.text.length;
                }

                var pos = 0,
                    range = target.createTextRange(),
                    range2 = document.selection.createRange().duplicate(),
                    bookmark = range2.getBookmark();
                range.moveToBookmark(bookmark);
                while (range.moveStart('character', -1) !== 0) pos++;
                return pos;
            }

            return 0;
        }

        if (pos == -1)
            pos = this[isContentEditable ? 'text' : 'val']().length;

        if (window.getSelection) {

            if (isContentEditable) {
                target.focus();
                window.getSelection().collapse(target.firstChild, pos);
            } else
                target.setSelectionRange(pos, pos);
        } else if (document.body.createTextRange) {
            var range = document.body.createTextRange();
            range.moveToElementText(target);
            range.moveStart('character', pos);
            range.collapse(true);
            range.select();
        }
        if (!isContentEditable)
            target.focus();
        return pos;
    }
})(jQuery)
