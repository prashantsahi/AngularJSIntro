package com.intelligrape.intellimeet

class TodoRole {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
