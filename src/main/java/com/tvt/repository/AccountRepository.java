package com.tvt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tvt.entity.Account;

public interface AccountRepository extends JpaRepository<Account, Integer> {

	Account findByUsernameAndPassword(String username, String password);
	
}
