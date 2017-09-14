package com.analysis.hibernate;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */

public class Message implements java.io.Serializable {

	// Fields

	private Integer messageId;
	private Integer senderId;
	private Integer receiverId;
	private String content;
	private Boolean isRead;

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** minimal constructor */
	public Message(Integer senderId, Integer receiverId, String content) {
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.content = content;
	}

	/** full constructor */
	public Message(Integer senderId, Integer receiverId, String content, Boolean isRead) {
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.content = content;
		this.isRead = isRead;
	}

	// Property accessors

	public Integer getMessageId() {
		return this.messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public Integer getSenderId() {
		return this.senderId;
	}

	public void setSenderId(Integer senderId) {
		this.senderId = senderId;
	}

	public Integer getReceiverId() {
		return this.receiverId;
	}

	public void setReceiverId(Integer receiverId) {
		this.receiverId = receiverId;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Boolean getIsRead() {
		return this.isRead;
	}

	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}

}