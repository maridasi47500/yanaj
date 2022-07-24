function addNoviusCdnTacScript(version, filename) {
    const s = document.createElement('script');
    s.setAttribute('src', 'https://cdn.novius.net/novius-tac/'+version+'/'+filename);
    s.setAttribute('type', 'text/javascript');
    s.setAttribute('onload', 'cdnNoviusTacLoaded()')
    document.body.appendChild(s);
}

const noviusCdnTacVersion = '1.3.8';
window.tarteaucitronForceCDN = 'https://cdn.novius.net/novius-tac/'+noviusCdnTacVersion+'/';
addNoviusCdnTacScript(noviusCdnTacVersion, 'tarteaucitron.js');
