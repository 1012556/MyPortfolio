# Personal Portfolio Website

A modern, responsive portfolio website built with:
- **Backend**: ASP.NET Core 9.0 (C#)
- **Frontend**: TypeScript with Vite
- **Styling**: CSS3 with responsive design

## Features

- 🎨 Modern, responsive design
- 🚀 Fast development with Vite
- 📱 Mobile-friendly layout
- 🔧 Professional portfolio sections:
  - Profile information with contact details
  - Work experience timeline
  - Project showcase
  - Skills with proficiency levels
  - Education history
- 🌐 RESTful API backend
- 📊 OpenAPI documentation
- 🎯 TypeScript for type safety

## Quick Start

### Prerequisites
- .NET 9.0 SDK
- Node.js (version 18 or higher)
- npm

### Running the Application

1. **Clone and setup:**
   ```bash
   git clone <your-repo>
   cd ProfileWebsite
   ```

2. **Install frontend dependencies:**
   ```bash
   cd frontend
   npm install
   ```

3. **Start the full application** (recommended):
   - Open Command Palette (`Ctrl+Shift+P`)
   - Run task: "Start Full Application"
   
   This will start both the backend API and frontend dev server simultaneously.

4. **Or start components individually:**
   
   **Backend only:**
   ```bash
   cd MyWebsite
   dotnet run
   ```
   
   **Frontend only:**
   ```bash
   cd frontend
   npm run dev
   ```

### Building for Production

1. **Build everything:**
   - Run task: "Build All" from VS Code
   
2. **Or build individually:**
   ```bash
   # Build backend
   cd MyWebsite
   dotnet build
   
   # Build frontend
   cd frontend
   npm run build
   ```

## Project Structure

```
ProfileWebsite/
├── MyWebsite/                 # ASP.NET Core backend
│   ├── Controllers/           # API controllers
│   ├── Models/               # Data models
│   ├── Services/             # Business logic
│   ├── wwwroot/              # Static files (built frontend)
│   └── Program.cs            # Application entry point
├── frontend/                 # TypeScript frontend
│   ├── src/
│   │   ├── services/         # API client
│   │   ├── types/            # TypeScript interfaces
│   │   ├── styles/           # CSS styles
│   │   └── main.ts           # Application entry point
│   ├── index.html
│   ├── package.json
│   └── vite.config.ts
└── .vscode/                  # VS Code configuration
    ├── tasks.json            # Build tasks
    └── launch.json           # Debug configuration
```

## Customization

### 1. Update Your Information

Edit the data in `MyWebsite/Services/ProfileService.cs`:

- **Profile Info**: Name, title, bio, contact information
- **Experience**: Work history with technologies used
- **Projects**: Portfolio projects with links
- **Skills**: Technical skills with proficiency levels
- **Education**: Academic background

### 2. Styling

Modify `frontend/src/styles/main.css` to customize:
- Colors and themes
- Layout and spacing
- Responsive breakpoints
- Animations and transitions

### 3. Add New Sections

1. Create new models in `MyWebsite/Models/`
2. Add service methods in `MyWebsite/Services/`
3. Create controller endpoints in `MyWebsite/Controllers/`
4. Update TypeScript types in `frontend/src/types/`
5. Add rendering logic in `frontend/src/main.ts`

## API Endpoints

The backend provides these endpoints:

- `GET /api/profile/info` - Basic profile information
- `GET /api/profile/experiences` - Work experience
- `GET /api/profile/projects` - Portfolio projects
- `GET /api/profile/skills` - Technical skills
- `GET /api/profile/education` - Education history

## Development Tips

### VS Code Tasks
- **Build All**: Builds both frontend and backend
- **Start Full Application**: Runs both dev servers
- **Build Frontend**: TypeScript compilation and bundling
- **Start Frontend Dev**: Development server with hot reload
- **Build Backend**: .NET compilation
- **Start Backend**: ASP.NET Core development server

### Debugging
- Use F5 to start debugging the backend
- Frontend debugging through browser dev tools
- API documentation available at `/openapi` in development

### Hot Reload
- Frontend: Automatic reload on file changes
- Backend: Automatic restart on C# file changes

## Deployment

### Frontend Build
The frontend builds to `MyWebsite/wwwroot/`, so the ASP.NET Core app can serve it as static files.

### Production Deployment
1. Run "Build All" task
2. Deploy the `MyWebsite/` folder to your hosting platform
3. Ensure the hosting platform supports .NET 9.0

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
