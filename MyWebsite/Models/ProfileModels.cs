namespace MyWebsite.Models;

public record ProfileInfo(
    string FullName,
    string Title,
    string Email,
    string? Phone,
    string Bio,
    string? Location,
    string? ProfileImageUrl,
    List<SocialLink> SocialLinks
);

public record SocialLink(
    string Platform,
    string Url,
    string? IconClass = null
);

public record Experience(
    int Id,
    string Company,
    string Position,
    string Description,
    DateTime StartDate,
    DateTime? EndDate,
    List<string> Technologies,
    string? CompanyUrl = null
);

public record Project(
    int Id,
    string Title,
    string Description,
    List<string> Technologies,
    string? GithubUrl,
    string? LiveUrl,
    string? ImageUrl,
    DateTime CreatedDate
);

public record Skill(
    int Id,
    string Name,
    string Category,
    int ProficiencyLevel, // 1-5 scale
    string? IconClass = null
);

public record Education(
    int Id,
    string Institution,
    string Degree,
    string? FieldOfStudy,
    DateTime StartDate,
    DateTime? EndDate,
    string? Description
);
