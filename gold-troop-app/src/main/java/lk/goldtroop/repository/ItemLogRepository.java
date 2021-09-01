package net.codejava.repository;

import net.codejava.entity.ItemLog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemLogRepository extends JpaRepository<ItemLog,Integer> {
}
