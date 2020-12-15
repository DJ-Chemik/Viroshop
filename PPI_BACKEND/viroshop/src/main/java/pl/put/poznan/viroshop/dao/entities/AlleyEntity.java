package pl.put.poznan.viroshop.dao.entities;

import javax.persistence.*;
import java.util.Set;

@Entity
public class AlleyEntity {

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    private Long id;

    private int xposition;

    private int yposition;

    @OneToMany(mappedBy = "alleyEntity")
    private Set<ProductEntity> products;

    public AlleyEntity() {
    }

    public AlleyEntity(Long id, int xposition, int yposition, Set<ProductEntity> products) {
        this.id = id;
        this.xposition = xposition;
        this.yposition = yposition;
        this.products = products;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getXposition() {
        return xposition;
    }

    public void setXposition(int xposition) {
        this.xposition = xposition;
    }

    public int getYposition() {
        return yposition;
    }

    public void setYposition(int yposition) {
        this.yposition = yposition;
    }

    public Set<ProductEntity> getProducts() {
        return products;
    }

    public void setProducts(Set<ProductEntity> products) {
        this.products = products;
    }
}
