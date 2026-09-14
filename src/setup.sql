-- ========================================
-- Organization Table
-- ========================================

CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert sample data: Organizations
-- ========================================

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- Project Table
-- ========================================

CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,

    CONSTRAINT fk_project_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
);

-- ========================================
-- Insert sample data: Projects
-- ========================================

INSERT INTO project (
    organization_id,
    title,
    description,
    location,
    date
)
VALUES
(1, 'Community Center Renovation', 'Renovation of a community center to provide a safer space for local families.', 'Boise, Idaho', '2026-09-20'),
(1, 'Accessible Playground', 'Construction of an accessible playground for children of all abilities.', 'Rexburg, Idaho', '2026-10-05'),
(1, 'Emergency Home Repair', 'Repair damaged homes for families needing urgent assistance.', 'Idaho Falls, Idaho', '2026-10-18'),
(1, 'Neighborhood Shelter Project', 'Help construct a temporary shelter for people experiencing homelessness.', 'Pocatello, Idaho', '2026-11-02'),
(1, 'Community Library Upgrade', 'Improve and renovate a small neighborhood library.', 'Twin Falls, Idaho', '2026-11-15'),

(2, 'Urban Garden Setup', 'Create a community garden that provides fresh vegetables to local residents.', 'Boise, Idaho', '2026-09-25'),
(2, 'School Garden Program', 'Build and prepare a teaching garden for a local elementary school.', 'Rexburg, Idaho', '2026-10-08'),
(2, 'Community Compost Project', 'Create composting stations and teach residents how to reduce food waste.', 'Idaho Falls, Idaho', '2026-10-22'),
(2, 'Food Sustainability Workshop', 'Support a workshop teaching sustainable food production techniques.', 'Pocatello, Idaho', '2026-11-06'),
(2, 'Harvest Distribution Day', 'Harvest and distribute locally grown produce to families in need.', 'Twin Falls, Idaho', '2026-11-20'),

(3, 'Food Bank Volunteer Day', 'Organize volunteers to sort and distribute food at a local food bank.', 'Boise, Idaho', '2026-09-28'),
(3, 'Charity Clothing Drive', 'Collect, organize, and distribute donated clothing to local families.', 'Rexburg, Idaho', '2026-10-12'),
(3, 'Senior Assistance Day', 'Help senior citizens with household tasks and community transportation.', 'Idaho Falls, Idaho', '2026-10-26'),
(3, 'Community Cleanup', 'Coordinate volunteers to clean parks and public spaces.', 'Pocatello, Idaho', '2026-11-09'),
(3, 'Holiday Service Event', 'Coordinate volunteers to prepare holiday donations for families in need.', 'Twin Falls, Idaho', '2026-11-23');

-- ========================================
-- Category Table
-- ========================================

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- ========================================
-- Insert sample data: Categories
-- ========================================

INSERT INTO category (name)
VALUES
    ('Community Development'),
    ('Environment'),
    ('Volunteer Support');

-- ========================================
-- Project-Category Relationship Table
-- ========================================

CREATE TABLE project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,

    PRIMARY KEY (project_id, category_id),

    CONSTRAINT fk_project_category_project
        FOREIGN KEY (project_id)
        REFERENCES project(project_id),

    CONSTRAINT fk_project_category_category
        FOREIGN KEY (category_id)
        REFERENCES category(category_id)
);

-- ========================================
-- Associate Projects with Categories
-- ========================================

INSERT INTO project_category (project_id, category_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),

    (6, 2),
    (7, 2),
    (8, 2),
    (9, 2),
    (10, 2),

    (11, 3),
    (12, 3),
    (13, 3),
    (14, 3),
    (15, 3);