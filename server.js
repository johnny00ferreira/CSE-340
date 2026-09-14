import express from 'express';
import { testConnection } from './src/models/db.js';
import { getAllOrganizations } from './src/models/organizations.js';
import { getAllCategories } from './src/models/categories.js';
import { getAllProjects } from './src/models/projects.js';

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
    const organizations = await getAllOrganizations();
    const title = 'Our Partner Organizations';

    res.render('organizations', { title, organizations });
});

// Service Projects page
app.get('/projects', async (req, res) => {
    const projects = await getAllProjects();
    const title = 'Service Projects';

    res.render('projects', { title, projects });
});
// Categories page
app.get('/categories', async (req, res) => {
    const categories = await getAllCategories();
    const title = 'Service Project Categories';

    res.render('categories', { title, categories });
});

// Start the server
app.listen(port, async () => {
    try {
        await testConnection();
        console.log(`Server is running at http://127.0.0.1:${port}`);
        console.log(`Environment: ${nodeEnv}`);
    } catch (error) {
        console.error('Error connecting to the database:', error);
    }
});