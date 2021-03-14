package org.vice.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.vice.spring.domain.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    Optional<User> findById(Long ID);
}
