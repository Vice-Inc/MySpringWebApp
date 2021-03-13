package org.vice.spring.repository;

import org.springframework.data.repository.CrudRepository;
import org.vice.spring.domain.Message;

import java.util.List;

public interface MessageRepository extends CrudRepository<Message, Long> {
    List<Message> findByTag(String tag);
}
