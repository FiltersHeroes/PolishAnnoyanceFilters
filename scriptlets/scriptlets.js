// Collection of userscripts to be used for scriptlet injection on domains.

/// grant-fake-notification.js
/// alias gfn.js
// example.com##+js(gfn)
(function() {
    Notification = function() { };
    Notification.permission = 'default';
    Notification.requestPermission = function(callback) {
        Notification.permission = 'granted';
        if ( callback ) {
            setTimeout(callback, 0, 'granted');
        }
        return Promise.resolve('granted');
    };
})();