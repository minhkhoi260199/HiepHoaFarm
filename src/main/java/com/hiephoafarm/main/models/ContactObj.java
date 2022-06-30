package com.hiephoafarm.main.models;

import javax.persistence.*;

@Entity
@Table(name = "contact", schema = "hiephoafarm", catalog = "")
public class ContactObj {
   private String fullname;
   private String email;
   private String title;
   private String content;
   private Integer phone;
   private Integer idContact;

   @Basic
   @Column(name = "fullname", nullable = true, length = 150)
   public String getFullname() {
      return fullname;
   }

   public void setFullname(String fullname) {
      this.fullname = fullname;
   }

   @Basic
   @Column(name = "email", nullable = true, length = 150)
   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   @Basic
   @Column(name = "title", nullable = true, length = 150)
   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   @Basic
   @Column(name = "content", nullable = true, length = 5000)
   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      ContactObj that = (ContactObj) o;

      if (fullname != null ? !fullname.equals(that.fullname) : that.fullname != null) return false;
      if (email != null ? !email.equals(that.email) : that.email != null) return false;
      if (title != null ? !title.equals(that.title) : that.title != null) return false;
      if (content != null ? !content.equals(that.content) : that.content != null) return false;

      return true;
   }

   @Override
   public int hashCode() {
      int result = fullname != null ? fullname.hashCode() : 0;
      result = 31 * result + (email != null ? email.hashCode() : 0);
      result = 31 * result + (title != null ? title.hashCode() : 0);
      result = 31 * result + (content != null ? content.hashCode() : 0);
      return result;
   }

   @Basic
   @Column(name = "phone", nullable = true)
   public Integer getPhone() {
      return phone;
   }

   public void setPhone(Integer phone) {
      this.phone = phone;
   }

   @GeneratedValue(strategy = GenerationType.IDENTITY)
   @Id
   @Column(name = "id_contact", nullable = false)
   public Integer getIdContact() {
      return idContact;
   }

   public void setIdContact(Integer idContact) {
      this.idContact = idContact;
   }
}
