import { profileApi } from './services/api';
import type { ProfileInfo, Experience, Project, Skill, Education } from './types/api';
import './styles/main.css';

class PortfolioApp {
  private profileInfo: ProfileInfo | null = null;
  private experiences: Experience[] = [];
  private projects: Project[] = [];
  private skills: Skill[] = [];
  private education: Education[] = [];

  constructor() {
    this.init();
  }

  private async init(): Promise<void> {
    try {
      await this.loadData();
      this.render();
    } catch (error) {
      console.error('Failed to initialize app:', error);
      this.renderError('Failed to load portfolio data');
    }
  }

  private async loadData(): Promise<void> {
    try {
      const [profileInfo, experiences, projects, skills, education] = await Promise.all([
        profileApi.getProfileInfo(),
        profileApi.getExperiences(),
        profileApi.getProjects(),
        profileApi.getSkills(),
        profileApi.getEducation()
      ]);

      this.profileInfo = profileInfo;
      this.experiences = experiences;
      this.projects = projects;
      this.skills = skills;
      this.education = education;
    } catch (error) {
      console.error('Error loading data:', error);
      throw error;
    }
  }

  private render(): void {
    const app = document.getElementById('app');
    if (!app) return;

    app.innerHTML = `
      ${this.renderHeader()}
      ${this.renderNavigation()}
      ${this.renderExperience()}
      ${this.renderProjects()}
      ${this.renderSkills()}
      ${this.renderEducation()}
      ${this.renderFooter()}
    `;

    this.attachEventListeners();
  }

  private renderHeader(): string {
    if (!this.profileInfo) return '';

    const { fullName, title, bio, location, email, phone, profileImageUrl, socialLinks } = this.profileInfo;

    return `
      <header class="header" id="home">
        <div class="container">
          ${profileImageUrl ? `<img src="${profileImageUrl}" alt="${fullName}" class="profile-image">` : ''}
          <h1>${fullName}</h1>
          <p class="title">${title}</p>
          <p class="bio">${bio}</p>
          
          <div class="contact-info">
            ${location ? `<div class="contact-item"><i class="fas fa-map-marker-alt"></i> ${location}</div>` : ''}
            <a href="mailto:${email}" class="contact-item"><i class="fas fa-envelope"></i> ${email}</a>
            ${phone ? `<a href="tel:${phone}" class="contact-item"><i class="fas fa-phone"></i> ${phone}</a>` : ''}
          </div>
          
          <div class="social-links">
            ${socialLinks.map(link => `
              <a href="${link.url}" target="_blank" class="social-link" title="${link.platform}">
                <i class="${link.iconClass || 'fas fa-link'}"></i>
              </a>
            `).join('')}
          </div>
        </div>
      </header>
    `;
  }

  private renderNavigation(): string {
    return `
      <nav class="nav">
        <div class="container">
          <ul>
            <li><a href="#home">Home</a></li>
            <li><a href="#experience">Experience</a></li>
            <li><a href="#projects">Projects</a></li>
            <li><a href="#skills">Skills</a></li>
            <li><a href="#education">Education</a></li>
          </ul>
        </div>
      </nav>
    `;
  }

  private renderExperience(): string {
    return `
      <section class="section" id="experience">
        <div class="container">
          <h2>Experience</h2>
          <div class="timeline">
            ${this.experiences.map(exp => `
              <div class="timeline-item">
                <div class="timeline-header">
                  <div>
                    <div class="timeline-company">${exp.company}</div>
                    <div class="timeline-title">${exp.position}</div>
                  </div>
                  <div class="timeline-date">
                    ${this.formatDate(exp.startDate)} - ${exp.endDate ? this.formatDate(exp.endDate) : 'Present'}
                  </div>
                </div>
                <div class="timeline-description">${exp.description}</div>
                <div class="technologies">
                  ${exp.technologies.map(tech => `<span class="tech-tag">${tech}</span>`).join('')}
                </div>
              </div>
            `).join('')}
          </div>
        </div>
      </section>
    `;
  }

  private renderProjects(): string {
    return `
      <section class="section" id="projects">
        <div class="container">
          <h2>Projects</h2>
          <div class="projects-grid">
            ${this.projects.map(project => `
              <div class="project-card">
                <div class="project-image">
                  ${project.imageUrl ? `<img src="${project.imageUrl}" alt="${project.title}">` : '<i class="fas fa-code"></i>'}
                </div>
                <div class="project-content">
                  <h3 class="project-title">${project.title}</h3>
                  <p class="project-description">${project.description}</p>
                  <div class="technologies">
                    ${project.technologies.map(tech => `<span class="tech-tag">${tech}</span>`).join('')}
                  </div>
                  <div class="project-links">
                    ${project.githubUrl ? `<a href="${project.githubUrl}" target="_blank" class="project-link"><i class="fab fa-github"></i> Code</a>` : ''}
                    ${project.liveUrl ? `<a href="${project.liveUrl}" target="_blank" class="project-link"><i class="fas fa-external-link-alt"></i> Live Demo</a>` : ''}
                  </div>
                </div>
              </div>
            `).join('')}
          </div>
        </div>
      </section>
    `;
  }

  private renderSkills(): string {
    const skillsByCategory = this.groupSkillsByCategory();
    
    return `
      <section class="section" id="skills">
        <div class="container">
          <h2>Skills</h2>
          <div class="skills-container">
            ${Object.entries(skillsByCategory).map(([category, skills]) => `
              <div class="skills-category">
                <h3>${category}</h3>
                <div class="skills-grid">
                  ${skills.map(skill => `
                    <div class="skill-item">
                      ${skill.iconClass ? `<div class="skill-icon"><i class="${skill.iconClass}"></i></div>` : ''}
                      <div class="skill-name">${skill.name}</div>
                      <div class="skill-level">
                        ${Array.from({ length: 5 }, (_, i) => `
                          <div class="skill-dot ${i < skill.proficiencyLevel ? 'active' : ''}"></div>
                        `).join('')}
                      </div>
                    </div>
                  `).join('')}
                </div>
              </div>
            `).join('')}
          </div>
        </div>
      </section>
    `;
  }

  private renderEducation(): string {
    return `
      <section class="section" id="education">
        <div class="container">
          <h2>Education</h2>
          <div class="timeline">
            ${this.education.map(edu => `
              <div class="timeline-item">
                <div class="timeline-header">
                  <div>
                    <div class="timeline-company">${edu.institution}</div>
                    <div class="timeline-title">${edu.degree}${edu.fieldOfStudy ? ` in ${edu.fieldOfStudy}` : ''}</div>
                  </div>
                  <div class="timeline-date">
                    ${this.formatDate(edu.startDate)} - ${edu.endDate ? this.formatDate(edu.endDate) : 'Present'}
                  </div>
                </div>
                ${edu.description ? `<div class="timeline-description">${edu.description}</div>` : ''}
              </div>
            `).join('')}
          </div>
        </div>
      </section>
    `;
  }

  private renderFooter(): string {
    return `
      <footer class="footer">
        <div class="container">
          <p>&copy; ${new Date().getFullYear()} ${this.profileInfo?.fullName || 'Portfolio'}. All rights reserved.</p>
        </div>
      </footer>
    `;
  }

  private renderError(message: string): void {
    const app = document.getElementById('app');
    if (app) {
      app.innerHTML = `
        <div class="container">
          <div class="error">
            <h2>Error</h2>
            <p>${message}</p>
          </div>
        </div>
      `;
    }
  }

  private groupSkillsByCategory(): Record<string, Skill[]> {
    return this.skills.reduce((acc, skill) => {
      if (!acc[skill.category]) {
        acc[skill.category] = [];
      }
      acc[skill.category].push(skill);
      return acc;
    }, {} as Record<string, Skill[]>);
  }

  private formatDate(dateString: string): string {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short' });
  }

  private attachEventListeners(): void {
    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
      anchor.addEventListener('click', (e) => {
        e.preventDefault();
        const targetId = anchor.getAttribute('href')?.slice(1);
        const targetElement = document.getElementById(targetId || '');
        if (targetElement) {
          targetElement.scrollIntoView({ behavior: 'smooth' });
        }
      });
    });
  }
}

// Initialize the app when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
  new PortfolioApp();
});
