import axios from 'axios';
import type { ProfileInfo, Experience, Project, Skill, Education } from '../types/api';

const API_BASE_URL = '/api';

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json'
  }
});

export const profileApi = {
  getProfileInfo: async (): Promise<ProfileInfo> => {
    const response = await api.get<ProfileInfo>('/profile/info');
    return response.data;
  },

  getExperiences: async (): Promise<Experience[]> => {
    const response = await api.get<Experience[]>('/profile/experiences');
    return response.data;
  },

  getProjects: async (): Promise<Project[]> => {
    const response = await api.get<Project[]>('/profile/projects');
    return response.data;
  },

  getSkills: async (): Promise<Skill[]> => {
    const response = await api.get<Skill[]>('/profile/skills');
    return response.data;
  },

  getEducation: async (): Promise<Education[]> => {
    const response = await api.get<Education[]>('/profile/education');
    return response.data;
  }
};
