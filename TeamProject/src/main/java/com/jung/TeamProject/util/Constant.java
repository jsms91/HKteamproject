package com.jung.TeamProject.util;

import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.transaction.PlatformTransactionManager;

import com.jung.TeamProject.dao.BDaoTemplate;
import com.jung.TeamProject.dao.UserDao;

public class Constant {
	public static JdbcTemplate template; 
	public static PlatformTransactionManager transactionManager;
	public static BDaoTemplate dao;
}
