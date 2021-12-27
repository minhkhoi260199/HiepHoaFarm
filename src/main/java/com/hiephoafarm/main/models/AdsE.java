package com.hiephoafarm.main.models;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "ads", catalog = "hiephoafarm")
public class AdsE {
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
        AdsE adsE = (AdsE) o;
        return idAds == adsE.idAds && Objects.equals(adsname, adsE.adsname) && Objects.equals(adscontent, adsE.adscontent);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idAds, adsname, adscontent);
    }
}
