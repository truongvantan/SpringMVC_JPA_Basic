package com.tvt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tvt.entity.Account;
import com.tvt.repository.AccountRepository;

@Service("accountService")
@Transactional
public class AccountService {

	@Autowired
	private AccountRepository userRepository;

	public List<Account> findAll() {
		return userRepository.findAll();
	}

	public Account findByUsernameAndPassword(String username, String password) {
		return userRepository.findByUsernameAndPassword(username, password);
	}
}
