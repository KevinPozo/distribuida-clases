plugins {
    id("java")
    id("war")
}

group = "org.example"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    implementation("commons-collections:commons-collections:3.2.2")
    implementation("jakarta.ws.rs:jakarta.ws.rs-api:4.0.0")
    implementation("org.glassfish.jersey.containers:jersey-container-servlet:3.1.9")
    implementation("org.glassfish.jersey.inject:jersey-hk2:3.1.9")
}