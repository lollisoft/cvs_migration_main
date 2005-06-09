/*
    DMF Distributed Multiplatform Framework (the initial goal of this library)
    This file is part of lbDMF.
    Copyright (C) 2002  Lothar Behrens (lothar.behrens@lollisoft.de)

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


    The author of this work will be reached by e-Mail or paper mail.
    e-Mail: lothar.behrens@lollisoft.de
    p-Mail: Lothar Behrens
            Rosmarinstr. 3
            
            40235 Duesseldorf (germany)
*/
#ifdef WINDOWS
#include <windows.h>
#include <io.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

//#include <conio.h>

#ifdef __WATCOMC__
#include <ctype.h>
#endif
#ifdef __cplusplus
}
#endif

#include <stdio.h>
#ifndef OSX
#include <malloc.h>
#endif
#ifdef OSX
#include <sys/malloc.h>
#endif

#include <lbConfigHook.h>
#include <lbInterfaces.h>



#define LB_PLUGINMANAGER_DLL
#include <lbpluginmanager-module.h>

// For compilers that support precompilation, includes "wx/wx.h".
#include <wx/wxprec.h>

#ifdef __BORLANDC__
#pragma hdrstop
#endif

#ifndef WX_PRECOMP
#include <wx/wx.h>
#endif

#if defined(__WXGTK__) || defined(__WXMOTIF__)
//#include "mondrian.xpm"
#endif

#include "wx/wizard.h"


#include <lbDatabaseForm.h>
#ifdef __GNUG__
#pragma implementation "dynamic.cpp"
#pragma interface "dynamic.cpp"
#endif

// For compilers that support precompilation, includes "wx/wx.h".
#include <wx/wxprec.h>

#ifdef __BORLANDC__
#pragma hdrstop
#endif

#ifndef WX_PRECOMP
#include <wx/wx.h>
#endif

#if defined(__WXGTK__) || defined(__WXMOTIF__)
//#include "mondrian.xpm"
#endif

#include "wx/wizard.h"


FormularFieldInformation::FormularFieldInformation(char const * formularname, lb_I_Query* query) {

	lbErrCodes err = ERR_NONE;

	UAP_REQUEST(getModuleInstance(), lb_I_Database, database)

	REQUEST(getModuleInstance(), lb_I_Container, ROFields)
	REQUEST(getModuleInstance(), lb_I_Container, SCFields)

	database->init();

	char* lbDMFPasswd = getenv("lbDMFPasswd");
	char* lbDMFUser   = getenv("lbDMFUser");

	if (!lbDMFUser) lbDMFUser = "dba";
	if (!lbDMFPasswd) lbDMFPasswd = "trainres";

	database->connect("lbDMF", lbDMFUser, lbDMFPasswd);

	UAP(lb_I_Query, ROquery, __FILE__, __LINE__)

	ROquery = database->getQuery(0);

	char buf[] = "select tablename, name, \"specialColumn\", \"controlType\", ro from column_types";

	ROquery->query(buf);
	
	err = ROquery->first();

	while (err == ERR_NONE) {
	        UAP(lb_I_String, tablename, __FILE__, __LINE__)
	        UAP(lb_I_String, fieldname, __FILE__, __LINE__)
	        UAP(lb_I_String, specialColumn, __FILE__, __LINE__)
	        UAP(lb_I_String, columnType, __FILE__, __LINE__)
	        UAP(lb_I_String, ro, __FILE__, __LINE__)

	        tablename = ROquery->getAsString(1);
		fieldname = ROquery->getAsString(2);
		specialColumn = ROquery->getAsString(3);
		columnType = ROquery->getAsString(4);
		ro = ROquery->getAsString(5);

		fieldname->trim();
		columnType->trim();

		for (int i = 1; i <= query->getColumns(); i++) {
			UAP_REQUEST(getModuleInstance(), lb_I_String, col)
			
			col->setData(query->getColumnName(i));

			if ((strcmp(col->charrep(), fieldname->charrep()) == 0) && (strcmp("true", ro->charrep()) == 0)) {
				UAP(lb_I_KeyBase, key, __FILE__, __LINE__)
				UAP(lb_I_Unknown, uk, __FILE__, __LINE__)
				
				QI(col, lb_I_KeyBase, key, __FILE__, __LINE__)
				QI(col, lb_I_Unknown, uk, __FILE__, __LINE__)
				
				ROFields->insert(&uk, &key);
			}

			if ((strcmp(col->charrep(), fieldname->charrep()) == 0) && (strcmp("true", specialColumn->charrep()) == 0)) {
				UAP(lb_I_KeyBase, key, __FILE__, __LINE__)
				UAP(lb_I_Unknown, uk, __FILE__, __LINE__)
				
				QI(col, lb_I_KeyBase, key, __FILE__, __LINE__)
				QI(columnType, lb_I_Unknown, uk, __FILE__, __LINE__)
				
				SCFields->insert(&uk, &key);
			}
		}		
		err = ROquery->next();
	}
	
	if (err == WARN_DB_NODATA) {
                UAP(lb_I_String, tablename, __FILE__, __LINE__)
                UAP(lb_I_String, fieldname, __FILE__, __LINE__)
		UAP(lb_I_String, specialColumn, __FILE__, __LINE__)
		UAP(lb_I_String, columnType, __FILE__, __LINE__)
		UAP(lb_I_String, ro, __FILE__, __LINE__)
		
                tablename = ROquery->getAsString(1);
                fieldname = ROquery->getAsString(2);
		specialColumn = ROquery->getAsString(3);
		columnType = ROquery->getAsString(4);
		ro = ROquery->getAsString(5);

		fieldname->trim();
		columnType->trim();

		
                for (int i = 1; i <= query->getColumns(); i++) {
                        UAP_REQUEST(getModuleInstance(), lb_I_String, col)

                        col->setData(query->getColumnName(i));
			
			if ((strcmp(col->charrep(), fieldname->charrep()) == 0) && (strcmp("true", ro->charrep()) == 0)) {
                                UAP(lb_I_KeyBase, key, __FILE__, __LINE__)
                                UAP(lb_I_Unknown, uk, __FILE__, __LINE__)

                                QI(col, lb_I_KeyBase, key, __FILE__, __LINE__)
                                QI(col, lb_I_Unknown, uk, __FILE__, __LINE__)

                                ROFields->insert(&uk, &key);
                        }

			if ((strcmp(col->charrep(), fieldname->charrep()) == 0) && (strcmp("true", specialColumn->charrep()) == 0)) {
				UAP(lb_I_KeyBase, key, __FILE__, __LINE__)
				UAP(lb_I_Unknown, uk, __FILE__, __LINE__)
				
				QI(col, lb_I_KeyBase, key, __FILE__, __LINE__)
				QI(columnType, lb_I_Unknown, uk, __FILE__, __LINE__)
				
				SCFields->insert(&uk, &key);
			}
                }
	}
}

bool FormularFieldInformation::isReadonly(char* field) {
	lbErrCodes err = ERR_NONE;
	
	UAP_REQUEST(getModuleInstance(), lb_I_String, f)
	f->setData(field);
	
	f->trim();
	
	UAP(lb_I_KeyBase, key, __FILE__, __LINE__)
	QI(f, lb_I_KeyBase, key, __FILE__, __LINE__)
	
	if (ROFields->exists(&key) == 1) {
		return true;
	}
	else {
		return false;
	}
	
}

bool FormularFieldInformation::isSpecialColumn(char* field) {
	lbErrCodes err = ERR_NONE;
	
	UAP_REQUEST(getModuleInstance(), lb_I_String, f)
	f->setData(field);
	
	f->trim();

	UAP(lb_I_KeyBase, key, __FILE__, __LINE__)
	QI(f, lb_I_KeyBase, key, __FILE__, __LINE__)
	
	if (SCFields->exists(&key) == 1) {
		return true;
	}

	return false;
}

char* FormularFieldInformation::getControlType(char* name) {
	lbErrCodes err = ERR_NONE;
	
	UAP_REQUEST(getModuleInstance(), lb_I_String, f)
	f->setData(name);
	
	f->trim();
	
	UAP(lb_I_KeyBase, key, __FILE__, __LINE__)
	QI(f, lb_I_KeyBase, key, __FILE__, __LINE__)

	if (SCFields->exists(&key) == 1) {
		UAP(lb_I_Unknown, uk, __FILE__, __LINE__)
		UAP_REQUEST(getModuleInstance(), lb_I_String, type)
		uk = SCFields->getElement(&key);
		QI(uk, lb_I_String, type, __FILE__, __LINE__)
		
		return strdup(type->charrep());
	}
	
	return "";
}

