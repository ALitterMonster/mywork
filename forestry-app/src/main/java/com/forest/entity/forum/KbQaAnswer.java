package com.forest.entity.forum;

import java.util.Date;

public class KbQaAnswer {
    private Integer id;

    private String questionid;

    private String memo;

    private String answerid;

    private String answername;

    private Date answertime;

    private Integer cmtcount;

    private Integer goodcount;

    private String removed;

    private String deleterid;

    private String deletername;

    private Date deletetime;

    private String deletememo;

    private String regioncode;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestionid() {
        return questionid;
    }

    public void setQuestionid(String questionid) {
        this.questionid = questionid == null ? null : questionid.trim();
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo == null ? null : memo.trim();
    }

    public String getAnswerid() {
        return answerid;
    }

    public void setAnswerid(String answerid) {
        this.answerid = answerid == null ? null : answerid.trim();
    }

    public String getAnswername() {
        return answername;
    }

    public void setAnswername(String answername) {
        this.answername = answername == null ? null : answername.trim();
    }

    public Date getAnswertime() {
        return answertime;
    }

    public void setAnswertime(Date answertime) {
        this.answertime = answertime;
    }

    public Integer getCmtcount() {
        return cmtcount;
    }

    public void setCmtcount(Integer cmtcount) {
        this.cmtcount = cmtcount;
    }

    public Integer getGoodcount() {
        return goodcount;
    }

    public void setGoodcount(Integer goodcount) {
        this.goodcount = goodcount;
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

    public Date getDeletetime() {
        return deletetime;
    }

    public void setDeletetime(Date deletetime) {
        this.deletetime = deletetime;
    }

    public String getDeletememo() {
        return deletememo;
    }

    public void setDeletememo(String deletememo) {
        this.deletememo = deletememo == null ? null : deletememo.trim();
    }

    public String getRegioncode() {
        return regioncode;
    }

    public void setRegioncode(String regioncode) {
        this.regioncode = regioncode == null ? null : regioncode.trim();
    }
}