package projects.service;

import projects.dao.ProjectDao;
import projects.entity.Project;

public class ProjectService {
	//private static final String SCHEMA_FILE = "project_schema.sql";
	
	private ProjectDao projectDao = new ProjectDao();
	
	public Project addProject(Project project) {
		return projectDao.insertProject(project);
	}
}

/*
import projects.Project;
import projects.dao.ProjectDao;

public class ProjectService {
	private ProjectDao  projectDao = new ProjectDao();
	
	public Project addProject(Project project) {
		
		return projectDao.insertProject(project);
	}
}
*/