package mydata;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class companyData {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String cname;
    private String cadd;
    private int Userid;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getAdd() {
        return cadd;
    }

    public void setAdd(String add) {
        this.cadd = add;
    }

    public int getUserid() {
        return Userid;
    }

    public void setUserid(int Userid) {
        this.Userid = Userid;
    }

    @Override
    public String toString() {
        return "companyData{" + "id=" + id + ", cname=" + cname + ", cadd=" + cadd + ", Userid=" + Userid + '}';
    }

}
