import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { HttpClient } from "@angular/common/http";

@Injectable()
export class ApiService {

    constructor(private httpClient : HttpClient) {

    }

    getTokenFromLogin(): Observable<any>{
        return this.httpClient.get("localhost:8080/api/login")
    }

}