package pl.put.poznan.viroshop.dao.models;

import java.time.LocalDate;
import java.util.List;

public class CreateReservationModel {

    private LocalDate date;
    private int quarterOfDay;
    private List<CreateProductReservationModel> productReservations;
    private Long shopId;
    private Long userId;

    public CreateReservationModel() {
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getQuarterOfDay() {
        return quarterOfDay;
    }

    public void setQuarterOfDay(int quarterOfDay) {
        this.quarterOfDay = quarterOfDay;
    }

    public List<CreateProductReservationModel> getProductReservations() {
        return productReservations;
    }

    public void setProductReservations(List<CreateProductReservationModel> productReservations) {
        this.productReservations = productReservations;
    }

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
