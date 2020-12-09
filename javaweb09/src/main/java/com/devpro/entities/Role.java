package com.devpro.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name = "role")
public class Role extends BaseEntity implements GrantedAuthority {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2099703289660281262L;

	@Column(name = "name", nullable = false)
	private String name;
	
	@Column(name = "code", nullable = false)
	private String code;
	
	// 1 category -> N products
		@OneToMany(cascade = CascadeType.ALL, mappedBy = "role", fetch = FetchType.LAZY)
		private List<User> listUser = new ArrayList<User>();

		public void addUser(User user) {
			listUser.add(user);
			user.setRole(this);
		}

		public void removeUser(User user) {
			listUser.remove(user);
			user.setRole(null);
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getCode() {
			return code;
		}

		public void setCode(String code) {
			this.code = code;
		}

		public List<User> getListUser() {
			return listUser;
		}

		public void setListUser(List<User> listUser) {
			this.listUser = listUser;
		}

		@Override
		public String getAuthority() {
			return this.name;
		}
}
