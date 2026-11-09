import org.gradle.kotlin.dsl.implementation

plugins {
    id("java")
    id("io.quarkus") version "3.40.1.1"
    id("io.freefair.lombok") version "9.8.3"
}

group = "com.programacion.distribuida"
version = "unspecified"

repositories {
    mavenCentral()
}
val quarkusVersion = "3.40.1.1"
dependencies {
    implementation(enforcedPlatform("io.quarkus.platform:quarkus-bom:$quarkusVersion"))
    //CDI
    implementation("io.quarkus:quarkus-arc")
    //DI
    implementation("io.quarkus:quarkus-rest")
    //JSON B
    implementation("io.quarkus:quarkus-rest-jsonb")
}
java {
    sourceCompatibility = JavaVersion.VERSION_25
    targetCompatibility = JavaVersion.VERSION_25
}

tasks.test {
    useJUnitPlatform()
}
