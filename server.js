import express from 'express';

// Define the application environment
const nodeEnv = process.env.NODE_ENV?.toLowerCase() || 'production';

// Define the port number the server will listen on
const port = process.env.PORT || 3000;

const app = express();

// Configure EJS
app.set('view engine', 'ejs');
app.set('views', './src/views');

// Serve static files from the public folder
app.use(express.static('public'));

// Home page
app.get('/', async (req, res) => {
    const title = 'Home';
    res.render('home', { title });
});

// Organizations page
app.get('/organizations', async (req, res) => {
    const title = 'Organizations';
    res.render('organizations', { title });
});

// Service Projects page
app.get('/projects', async (req, res) => {
    const title = 'Service Projects';
    res.render('projects', { title });
});

// Categories page
app.get('/categories', async (req, res) => {
    const title = 'Categories';
    res.render('categories', { title });
});

// Start the server
app.listen(port, () => {
    console.log(`Server is running at http://127.0.0.1:${port}`);
    console.log(`Environment: ${nodeEnv}`);
});