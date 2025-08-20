package com.example.testfive.repository;

import com.example.testfive.entity.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserRepository extends JpaRepository<Person, String> {
    Optional<Person> findByEmail(String email);
}
