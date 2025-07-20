using MyWebsite.Models;

namespace MyWebsite.Services;

public interface IProfileService
{
    ProfileInfo GetProfileInfo();
    List<Experience> GetExperiences();
    List<Project> GetProjects();
    List<Skill> GetSkills();
    List<Education> GetEducation();
}

public class ProfileService : IProfileService
{
    public ProfileInfo GetProfileInfo()
    {
        return new ProfileInfo(
            FullName: "Your Name", // Update with your actual name
            Title: "Full Stack Developer", // Update with your title
            Email: "your.email@example.com", // Update with your email
            Phone: "+1 (555) 123-4567", // Update with your phone
            Bio: "Passionate full stack developer with expertise in C# and TypeScript. I love building scalable web applications and learning new technologies.",
            Location: "Your City, Country", // Update with your location
            ProfileImageUrl: null, // Add your profile image URL
            SocialLinks: new List<SocialLink>
            {
                new("GitHub", "https://github.com/yourusername", "fab fa-github"),
                new("LinkedIn", "https://linkedin.com/in/yourprofile", "fab fa-linkedin"),
                new("Twitter", "https://twitter.com/yourusername", "fab fa-twitter")
            }
        );
    }

    public List<Experience> GetExperiences()
    {
        return new List<Experience>
        {
            new(
                Id: 1,
                Company: "Tech Company ABC",
                Position: "Senior Full Stack Developer",
                Description: "Led development of web applications using C# and TypeScript. Collaborated with cross-functional teams to deliver high-quality software solutions.",
                StartDate: new DateTime(2022, 1, 1),
                EndDate: null, // Current position
                Technologies: new List<string> { "C#", "ASP.NET Core", "TypeScript", "React", "SQL Server" },
                CompanyUrl: "https://techcompanyabc.com"
            ),
            new(
                Id: 2,
                Company: "Previous Company",
                Position: "Full Stack Developer",
                Description: "Developed and maintained web applications. Worked on both frontend and backend development.",
                StartDate: new DateTime(2020, 6, 1),
                EndDate: new DateTime(2021, 12, 31),
                Technologies: new List<string> { "C#", "JavaScript", "Angular", "Entity Framework" }
            )
        };
    }

    public List<Project> GetProjects()
    {
        return new List<Project>
        {
            new(
                Id: 1,
                Title: "Personal Portfolio Website",
                Description: "A responsive portfolio website built with ASP.NET Core backend and TypeScript frontend.",
                Technologies: new List<string> { "C#", "ASP.NET Core", "TypeScript", "HTML5", "CSS3" },
                GithubUrl: "https://github.com/yourusername/portfolio",
                LiveUrl: "https://yourportfolio.com",
                ImageUrl: null,
                CreatedDate: new DateTime(2024, 1, 1)
            ),
            new(
                Id: 2,
                Title: "Task Management App",
                Description: "A full-stack task management application with real-time updates.",
                Technologies: new List<string> { "C#", "SignalR", "TypeScript", "React", "PostgreSQL" },
                GithubUrl: "https://github.com/yourusername/task-manager",
                LiveUrl: null,
                ImageUrl: null,
                CreatedDate: new DateTime(2023, 8, 15)
            )
        };
    }

    public List<Skill> GetSkills()
    {
        return new List<Skill>
        {
            // Backend
            new(1, "C#", "Backend", 5, "devicon-csharp-line"),
            new(2, "ASP.NET Core", "Backend", 5, "devicon-dotnetcore-plain"),
            new(3, "Entity Framework", "Backend", 4, "devicon-dotnetcore-plain"),
            new(4, "SQL Server", "Database", 4, "devicon-microsoftsqlserver-plain"),
            
            // Frontend
            new(5, "TypeScript", "Frontend", 5, "devicon-typescript-plain"),
            new(6, "JavaScript", "Frontend", 5, "devicon-javascript-plain"),
            new(7, "React", "Frontend", 4, "devicon-react-original"),
            new(8, "HTML5", "Frontend", 5, "devicon-html5-plain"),
            new(9, "CSS3", "Frontend", 4, "devicon-css3-plain"),
            
            // Tools
            new(10, "Git", "Tools", 5, "devicon-git-plain"),
            new(11, "Docker", "Tools", 3, "devicon-docker-plain"),
            new(12, "Azure", "Cloud", 3, "devicon-azure-plain")
        };
    }

    public List<Education> GetEducation()
    {
        return new List<Education>
        {
            new(
                Id: 1,
                Institution: "University Name",
                Degree: "Bachelor of Science",
                FieldOfStudy: "Computer Science",
                StartDate: new DateTime(2018, 9, 1),
                EndDate: new DateTime(2022, 6, 30),
                Description: "Focused on software engineering, algorithms, and data structures."
            )
        };
    }
}
