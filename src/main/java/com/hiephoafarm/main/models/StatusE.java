package com.hiephoafarm.main.models;

import javax.persistence.*;

@Entity
@Table(name = "status", schema = "hiephoafarm", catalog = "")
public class StatusE {
   private int idStatus;
   private String statusName;
   private String statusNameVie;

   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "id_status", nullable = false)
   public int getIdStatus() {
      return idStatus;
   }

   public void setIdStatus(int idStatus) {
      this.idStatus = idStatus;
   }

   @Basic
   @Column(name = "status_name", nullable = true, length = 45)
   public String getStatusName() {
      return statusName;
   }

   public void setStatusName(String statusName) {
      this.statusName = statusName;
   }

   @Basic
   @Column(name = "status_nameVie", nullable = true, length = 45)
   public String getStatusNameVie() {
      return statusNameVie;
   }

   public void setStatusNameVie(String statusNameVie) {
      this.statusNameVie = statusNameVie;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      StatusE statusE = (StatusE) o;

      if (idStatus != statusE.idStatus) return false;
      if (statusName != null ? !statusName.equals(statusE.statusName) : statusE.statusName != null) return false;
      if (statusNameVie != null ? !statusNameVie.equals(statusE.statusNameVie) : statusE.statusNameVie != null)
         return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = idStatus;
      result = 31 * result + (statusName != null ? statusName.hashCode() : 0);
      result = 31 * result + (statusNameVie != null ? statusNameVie.hashCode() : 0);
      return result;
   }
}
