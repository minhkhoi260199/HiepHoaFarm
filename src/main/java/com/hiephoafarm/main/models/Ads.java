package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Objects;

@Entity
public class Ads {
    private int idAds;
    private String adsname;
    private String adscontent;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_ads", nullable = false)
    public int getIdAds() {
        return idAds;
    }

    public void setIdAds(int idAds) {
        this.idAds = idAds;
    }

    @Basic
    @Column(name = "adsname", nullable = true, length = 45)
    public String getAdsname() {
        return adsname;
    }

    public void setAdsname(String adsname) {
        this.adsname = adsname;
    }

    @Basic
    @Column(name = "adscontent", nullable = true, length = 45)
    public String getAdscontent() {
        return adscontent;
    }

    public void setAdscontent(String adscontent) {
        this.adscontent = adscontent;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Ads ads = (Ads) o;
        return idAds == ads.idAds && Objects.equals(adsname, ads.adsname) && Objects.equals(adscontent, ads.adscontent);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idAds, adsname, adscontent);
    }
}
