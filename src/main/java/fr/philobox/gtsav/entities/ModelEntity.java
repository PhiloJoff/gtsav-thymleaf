package fr.philobox.gtsav.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.UUID;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="mod_model")
public class ModelEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id ;

    @NotNull
    @NotEmpty
    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    private SupplierEntity supplier;

    @Temporal(TemporalType.DATE)
    private Date dateCreation;

    @Temporal(TemporalType.DATE)
    private Date dateModification;


}
