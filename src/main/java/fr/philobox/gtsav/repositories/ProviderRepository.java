package fr.philobox.gtsav.repositories;

import fr.philobox.gtsav.entities.ProviderEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface ProviderRepository extends JpaRepository<ProviderEntity, UUID> {
}
