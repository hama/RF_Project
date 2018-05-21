var open = window.XMLHttpRequest.prototype.open,
    send = window.XMLHttpRequest.prototype.send,
    onReadyStateChange;

responseMap = new Map();

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

    if(this.onreadystatechange) {
        this._onreadystatechange = this.onreadystatechange;
    }
    //this.onreadystatechange = onReadyStateChangeReplacement;
    this.onreadystatechange = test;

    return send.apply(this, arguments);
}

function onReadyStateChangeReplacement() {
    console.warn('HTTP request ready state changed : ' + this.readyState);
    if(this._onreadystatechange) {
        return this._onreadystatechange.apply(this, arguments);
    }
}

function test() {
    console.warn('HTTP request ready state changed : ' + this.readyState);
    console.info(arguments)
    if(this._onreadystatechange) {
	if (this.readyState === 4) {
            var event = [].slice.call(arguments)[0]
            //console.log(event)
	    //console.log(event.currentTarget.responseURL)
	    rawString = event.currentTarget.response
	    replaceString = rawString.replace(new RegExp("\\\\","g"),"\\\\\\");
	    jobj = JSON.parse(replaceString);
            
	    responseMap.set(event.currentTarget.responseURL, jobj);
	    console.log(responseMap);
	}
        return this._onreadystatechange.apply(this, arguments);
    }
}


window.XMLHttpRequest.prototype.open = openReplacement;
window.XMLHttpRequest.prototype.send = sendReplacement;
