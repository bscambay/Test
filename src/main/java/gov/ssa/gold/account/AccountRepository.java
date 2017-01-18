package gov.ssa.gold.account;

import javax.persistence.*;
import javax.inject.Inject;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gov.ssa.gold.profile.EditProfileForm;

import org.springframework.security.crypto.password.PasswordEncoder;

@Repository
@Transactional(readOnly = true)
public class AccountRepository {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Inject
	private PasswordEncoder passwordEncoder;
	
	@Transactional
	public Account save(Account account) {
		account.setPassword(passwordEncoder.encode(account.getPassword()));
		entityManager.persist(account);
		return account;
	}
	
	public Account findByPin(String pin) {
		try {
			return entityManager.createNamedQuery(Account.FIND_BY_PIN, Account.class)
					.setParameter("pin", pin)
					.getSingleResult();
		} catch (PersistenceException e) {
			return null;
		}
	}
	
	@Transactional
	public void update(String pin, EditProfileForm form) {
		Account account = findByPin(pin);
		System.out.println("Before: " + account.toString());
		account.setName(form.getWholeName().toUpperCase());
		account.setDeskPhone(form.getDeskPhone());
		account.setEmailAddress((form.getEmailAddress() + Account.EMAIL_DOMAIN).toLowerCase());
		account.setJobTitle(form.getJobTitle().toUpperCase());
		account.setDivision(form.getDivision().toUpperCase());
		account.setBranch(form.getBranch().toUpperCase());
		account.setPhysicalLocation(form.getPhysicalLocation().toUpperCase());
		System.out.println("After: " + account.toString());
		entityManager.persist(account);
	}

	
}
