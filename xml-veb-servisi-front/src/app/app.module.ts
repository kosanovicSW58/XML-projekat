import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { RegistrationComponent } from './components/registration/registration.component';
import { ButtonComponent } from './components/button/button.component';
import { RouterModule, Routes} from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { ApiService } from './services/api.services';

const appRoutes: Routes = [
  { path: '', component : LoginComponent},
  { path: 'register', component : RegistrationComponent}
]

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegistrationComponent,
    ButtonComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    RouterModule.forRoot(appRoutes)
  ],
  providers: [ ApiService ],
  bootstrap: [AppComponent]
})
export class AppModule { }
