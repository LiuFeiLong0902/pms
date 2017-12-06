package com.sram.dao.impl;

import org.springframework.stereotype.Repository;

import com.sram.base.BaseDaoImpl;
import com.sram.dao.RoleDao;
import com.sram.entity.Role;

@Repository("roleDao")
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao {

}
