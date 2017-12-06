package com.sram.dao.impl;

import org.springframework.stereotype.Repository;

import com.sram.base.BaseDaoImpl;
import com.sram.dao.ProbationDao;
import com.sram.entity.Probation;

@Repository("probationDao")
public class ProbationDaoImple extends BaseDaoImpl<Probation> implements
		ProbationDao {

}
