package com.forest.entity.forum;

import java.util.Date;

public class KbQaQuestion {
    private Integer id;

    private String title;

    private String footnote;

    private String status;

    private String askid;

    private String askername;

    private Date updatetime;

    private Integer acount;

    private Integer vcount;

    private String selectedanswerid;

    private String selecteduserid;

    private String selectedusername;

    private Date selectedtime;

    private String closerid;

    private String closername;

    private Date closertime;

    private String closememo;

    private String removed;

    private String deleterid;

    private String deletername;

    private Date deletertime;

    private String deletermemo;

    private String regioncode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getFootnote() {
        return footnote;
    }

    public void setFootnote(String footnote) {
        this.footnote = footnote == null ? null : footnote.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getAskid() {
        return askid;
    }

    public void setAskid(String askid) {
        this.askid = askid == null ? null : askid.trim();
    }

    public String getAskername() {
        return askername;
    }

    public void setAskername(String askername) {
        this.askername = askername == null ? null : askername.trim();
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getAcount() {
        return acount;
    }

    public void setAcount(Integer acount) {
        this.acount = acount;
    }

    public Integer getVcount() {
        return vcount;
    }

    public void setVcount(Integer vcount) {
        this.vcount = vcount;
    }

    public String getSelectedanswerid() {
        return selectedanswerid;
    }

    public void setSelectedanswerid(String selectedanswerid) {
        this.selectedanswerid = selectedanswerid == null ? null : selectedanswerid.trim();
    }

    public String getSelecteduserid() {
        return selecteduserid;
    }

    public void setSelecteduserid(String selecteduserid) {
        this.selecteduserid = selecteduserid == null ? null : selecteduserid.trim();
    }

    public String getSelectedusername() {
        return selectedusername;
    }

    public void setSelectedusername(String selectedusername) {
        this.selectedusername = selectedusername == null ? null : selectedusername.trim();
    }

    public Date getSelectedtime() {
        return selectedtime;
    }

    public void setSelectedtime(Date selectedtime) {
        this.selectedtime = selectedtime;
    }

    public String getCloserid() {
        return closerid;
    }

    public void setCloserid(String closerid) {
        this.closerid = closerid == null ? null : closerid.trim();
    }

    public String getClosername() {
        return closername;
    }

    public void setClosername(String closername) {
        this.closername = closername == null ? null : closername.trim();
    }

    public Date getClosertime() {
        return closertime;
    }

    public void setClosertime(Date closertime) {
        this.closertime = closertime;
    }

    public String getClosememo() {
        return closememo;
    }

    public void setClosememo(String closememo) {
        this.closememo = closememo == null ? null : closememo.trim();
    }

    public String getRemoved() {
        return removed;
    }

    public void setRemoved(String removed) {
        this.removed = removed == null ? null : removed.trim();
    }

    public String getDeleterid() {
        return deleterid;
    }

    public void setDeleterid(String deleterid) {
        this.deleterid = deleterid == null ? null : deleterid.trim();
    }

    public String getDeletername() {
        return deletername;
    }

    public void setDeletername(String deletername) {
        this.deletername = deletername == null ? null : deletername.trim();
    }

    public Date getDeletertime() {
        return deletertime;
    }

    public void setDeletertime(Date deletertime) {
        this.deletertime = deletertime;
    }

    public String getDeletermemo() {
        return deletermemo;
    }

    public void setDeletermemo(String deletermemo) {
        this.deletermemo = deletermemo == null ? null : deletermemo.trim();
    }

    public String getRegioncode() {
        return regioncode;
    }

    public void setRegioncode(String regioncode) {
        this.regioncode = regioncode == null ? null : regioncode.trim();
    }
}