using Microsoft.AspNetCore.Mvc;
using MyWebsite.Models;
using MyWebsite.Services;

namespace MyWebsite.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProfileController : ControllerBase
{
    private readonly IProfileService _profileService;

    public ProfileController(IProfileService profileService)
    {
        _profileService = profileService;
    }

    [HttpGet("info")]
    public ActionResult<ProfileInfo> GetProfileInfo()
    {
        var profile = _profileService.GetProfileInfo();
        return Ok(profile);
    }

    [HttpGet("experiences")]
    public ActionResult<List<Experience>> GetExperiences()
    {
        var experiences = _profileService.GetExperiences();
        return Ok(experiences);
    }

    [HttpGet("projects")]
    public ActionResult<List<Project>> GetProjects()
    {
        var projects = _profileService.GetProjects();
        return Ok(projects);
    }

    [HttpGet("skills")]
    public ActionResult<List<Skill>> GetSkills()
    {
        var skills = _profileService.GetSkills();
        return Ok(skills);
    }

    [HttpGet("education")]
    public ActionResult<List<Education>> GetEducation()
    {
        var education = _profileService.GetEducation();
        return Ok(education);
    }
}
