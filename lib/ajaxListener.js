if (!window.correctMap) {
    var open = window.XMLHttpRequest.prototype.open,
        send = window.XMLHttpRequest.prototype.send,
        onReadyStateChange;

    correctMap = {};
    errorMap = {};

    function openReplacement(method, url, async, user, password) {
        var syncMode = async !== false ? 'async' : 'sync';
        console.warn(
            'Preparing ' +
            syncMode +
            ' HTTP request : ' +
            method +
            ' ' +
            url
        );
        return open.apply(this, arguments);
    }

    function sendReplacement(data) {
        console.warn('Sending HTTP request data : ', data);

        if (this.onreadystatechange) {
            this._onreadystatechange = this.onreadystatechange;
        }
        this.onreadystatechange = onReadyStateChangeReplacement;

        return send.apply(this, arguments);
    }

    function onReadyStateChangeReplacement() {
        console.warn('HTTP request ready state changed : ' + this.readyState);
        console.info(arguments)
        if (this._onreadystatechange) {
            if (this.readyState === 4 && this.status === 200) {
                var event = [].slice.call(arguments)[0],
                    rawString = event.currentTarget.response,
                    replaceString = rawString.replace(new RegExp("\\\\", "g"), "\\\\\\");
                respText = JSON.parse(replaceString);
                resultMap = {};
                resultMap['status'] = this.status;
                resultMap['responseText'] = respText;
                correctMap[event.currentTarget.responseURL] = resultMap;
            } else if (this.readyState === 4 && this.status !== 200) {
                var event = [].slice.call(arguments)[0],
                    respText = event.currentTarget.response;
                resultMap = {};
                resultMap['status'] = this.status;
                resultMap['responseText'] = respText;
                errorMap[event.currentTarget.responseURL] = resultMap;
            }
            return this._onreadystatechange.apply(this, arguments);
        }
    }

    window.XMLHttpRequest.prototype.open = openReplacement;
    window.XMLHttpRequest.prototype.send = sendReplacement;
}