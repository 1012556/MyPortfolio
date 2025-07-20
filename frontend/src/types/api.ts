// API Types
export interface ProfileInfo {
  fullName: string;
  title: string;
  email: string;
  phone?: string;
  bio: string;
  location?: string;
  profileImageUrl?: string;
  socialLinks: SocialLink[];
}

export interface SocialLink {
  platform: string;
  url: string;
  iconClass?: string;
}

export interface Experience {
  id: number;
  company: string;
  position: string;
  description: string;
  startDate: string;
  endDate?: string;
  technologies: string[];
  companyUrl?: string;
}

export interface Project {
  id: number;
  title: string;
  description: string;
  technologies: string[];
  githubUrl?: string;
  liveUrl?: string;
  imageUrl?: string;
  createdDate: string;
}

export interface Skill {
  id: number;
  name: string;
  category: string;
  proficiencyLevel: number;
  iconClass?: string;
}

export interface Education {
  id: number;
  institution: string;
  degree: string;
  fieldOfStudy?: string;
  startDate: string;
  endDate?: string;
  description?: string;
}
