package mydata;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class companyData {

    @Id
    private int id;
    private String cname;
    private String cadd;

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

    @Override
    public String toString() {
        return "companyData{" + "id=" + id + ", cname=" + cname + ", add=" + cadd + '}';
    }
}
