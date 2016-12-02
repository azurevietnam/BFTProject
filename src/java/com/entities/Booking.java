/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.entities;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author SoN-TunG
 */
public class Booking implements Serializable {

    private String bookingID, passengerID, detailID;
    private boolean bookingClosed;
    private Date bookingDate;
    private int adults, children, infants, firstClassBook, businessClassBook, economyClassBook;
    private double totalPrice;

    public Booking() {
    }

    public Booking(String bookingID, String passengerID, String detailID, boolean bookingClosed, Date bookingDate,
            int adults, int children, int infants, int firstClassBook, int businessClassBook, int economyClassBook, double totalPrice) {
        this.bookingID = bookingID;
        this.passengerID = passengerID;
        this.detailID = detailID;
        this.bookingClosed = bookingClosed;
        this.bookingDate = bookingDate;
        this.adults = adults;
        this.children = children;
        this.infants = infants;
        this.firstClassBook = firstClassBook;
        this.businessClassBook = businessClassBook;
        this.economyClassBook = economyClassBook;
        this.totalPrice = totalPrice;
    }

    public String getBookingID() {
        return bookingID;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public String getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(String passengerID) {
        this.passengerID = passengerID;
    }

    public String getDetailID() {
        return detailID;
    }

    public void setDetailID(String detailID) {
        this.detailID = detailID;
    }

    public boolean isBookingClosed() {
        return bookingClosed;
    }

    public void setBookingClosed(boolean bookingClosed) {
        this.bookingClosed = bookingClosed;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public int getAdults() {
        return adults;
    }

    public void setAdults(int adults) {
        this.adults = adults;
    }

    public int getChildren() {
        return children;
    }

    public void setChildren(int children) {
        this.children = children;
    }

    public int getInfants() {
        return infants;
    }

    public void setInfants(int infants) {
        this.infants = infants;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getFirstClassBook() {
        return firstClassBook;
    }

    public void setFirstClassBook(int firstClassBook) {
        this.firstClassBook = firstClassBook;
    }

    public int getBusinessClassBook() {
        return businessClassBook;
    }

    public void setBusinessClassBook(int businessClassBook) {
        this.businessClassBook = businessClassBook;
    }

    public int getEconomyClassBook() {
        return economyClassBook;
    }

    public void setEconomyClassBook(int economyClassBook) {
        this.economyClassBook = economyClassBook;
    }

}
