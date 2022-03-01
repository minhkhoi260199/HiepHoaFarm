package com.hiephoafarm.main.models;

import javax.persistence.*;

@Entity
@Table(name = "ads", schema = "hiephoafarm", catalog = "")
public class AdsE {
    private int idAds;
    private String adsname;
    private String adscontent;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id_ads")
    public int getIdAds() {
        return idAds;
    }

    public void setIdAds(int idAds) {
        this.idAds = idAds;
    }

    @Basic
    @Column(name = "adsname")
    public String getAdsname() {
        return adsname;
    }

    public void setAdsname(String adsname) {
        this.adsname = adsname;
    }

    @Basic
    @Column(name = "adscontent")
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

        if (idAds != adsE.idAds) return false;
        if (adsname != null ? !adsname.equals(adsE.adsname) : adsE.adsname != null) return false;
        if (adscontent != null ? !adscontent.equals(adsE.adscontent) : adsE.adscontent != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = idAds;
        result = 31 * result + (adsname != null ? adsname.hashCode() : 0);
        result = 31 * result + (adscontent != null ? adscontent.hashCode() : 0);
        return result;
    }
}
