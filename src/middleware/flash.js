/**
 * Flash Message Middleware
 *
 * Provides temporary message storage that survives redirects
 * but is consumed on render.
 * Messages are stored in the session and organized by type.
 */

const emptyMessages = () => ({
    success: [],
    error: [],
    warning: [],
    info: []
});

const flash = (req, res, next) => {
    req.flash = (type, message) => {
        if (!req.session.flash) {
            req.session.flash = emptyMessages();
        }

        // Store a new message
        if (type && message) {
            if (!req.session.flash[type]) {
                req.session.flash[type] = [];
            }

            req.session.flash[type].push(message);
            return;
        }

        // Get messages of one type
        if (type && !message) {
            const messages = req.session.flash[type] || [];

            req.session.flash[type] = [];

            return messages;
        }

        // Get all messages
        const allMessages = req.session.flash;

        req.session.flash = emptyMessages();

        return allMessages;
    };

    // Make existing flash messages available to EJS
    res.locals.messages = req.session.flash || emptyMessages();

    // Clear messages after making them available to the view
    req.session.flash = emptyMessages();

    next();
};

export default flash;