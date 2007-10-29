<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" extension-element-prefixes="exsl">

<xsl:import href="../include/lbDMFBaseTemplates.xsl"/>


<xsl:template name="createFormClassDecl">
		<xsl:param name="ApplicationID"/>
		<xsl:param name="FormularID"/>
		<xsl:param name="ParamFormularName"/>
		

<xsl:variable name="tempFormularName" select="$ParamFormularName"/>
<xsl:variable name="FormularName">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
			<xsl:value-of select="$tempFormularName"/>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="'-'"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="'>'"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="' '"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
</xsl:variable>

/////////////////////////////////////////////
// Generated By lbDMF codegenerator templates
/////////////////////////////////////////////

#ifndef __ANWENDUNGEN_
#define __ANWENDUNGEN_

////@@begin gen include
#include "wxActiveRecord.h"
#include &lt;wx/wx.h&gt;
#include &lt;wx/string.h&gt;
#include &lt;wx/datetime.h&gt;


////@@end gen include

////@@begin custom include
////@@end custom include

////@@begin gen forward
class <xsl:value-of select="$FormularName"/>;
class <xsl:value-of select="$FormularName"/>Row;
class <xsl:value-of select="$FormularName"/>RowSet;



////@@end gen forward

////@@begin custom forward
////@@end custom forward

<xsl:variable name="RealTableName"><xsl:for-each select="//lbDMF/formularfields/formular[@formularid=$FormularID]">
	<xsl:variable name="FieldName" select="@name"/>
	<xsl:variable name="TableName" select="@tablename"/>
	<xsl:if test="position()=1"><xsl:value-of select="@tablename"/></xsl:if></xsl:for-each></xsl:variable>

////@@begin gen arClass
// Have Formular <xsl:value-of select="$FormularID"/>.
class <xsl:value-of select="$FormularName"/>: public wxPostgresActiveRecord {
protected:
	<xsl:value-of select="$FormularName"/>Row* RowFromResult(DatabaseResultSet* result);
public:


	<xsl:value-of select="$FormularName"/>();
	<xsl:value-of select="$FormularName"/>(const wxString&amp; name,const wxString&amp; server=wxEmptyString,const wxString&amp; user=wxEmptyString,const wxString&amp; password=wxEmptyString,const wxString&amp; table=wxT("<xsl:value-of select="$RealTableName"/>"));
	<xsl:value-of select="$FormularName"/>(DatabaseLayer* database,const wxString&amp; table=wxT("<xsl:value-of select="$RealTableName"/>"));
	bool Create(const wxString&amp; name,const wxString&amp; server=wxEmptyString,const wxString&amp; user=wxEmptyString,const wxString&amp; password=wxEmptyString,const wxString&amp; table=wxT("<xsl:value-of select="$RealTableName"/>"));
	
	<xsl:value-of select="$FormularName"/>Row* New();
	bool Delete(int key);

	
	<xsl:value-of select="$FormularName"/>Row* Id(int key);

	<xsl:value-of select="$FormularName"/>Row* Where(const wxString&amp; whereClause);
	<xsl:value-of select="$FormularName"/>RowSet* WhereSet(const wxString&amp; whereClause,const wxString&amp; orderBy=wxEmptyString);
	<xsl:value-of select="$FormularName"/>RowSet* All(const wxString&amp; orderBy=wxEmptyString); 

////@@begin custom arClass
public:
////@@end custom arClass
};
////@@end gen arClass

////@@begin gen arRow
class <xsl:value-of select="$FormularName"/>Row: public wxActiveRecordRow{
public:
	<xsl:value-of select="$FormularName"/>Row();
	<xsl:value-of select="$FormularName"/>Row(const <xsl:value-of select="$FormularName"/>Row&amp; src);
	<xsl:value-of select="$FormularName"/>Row(<xsl:value-of select="$FormularName"/>* activeRecord);
	<xsl:value-of select="$FormularName"/>Row(DatabaseLayer* database,const wxString&amp; table=wxT("<xsl:value-of select="$RealTableName"/>"));
	<xsl:value-of select="$FormularName"/>Row&amp; operator=(const <xsl:value-of select="$FormularName"/>Row&amp; src);
	bool GetFromResult(DatabaseResultSet* result);
public:

<xsl:for-each select="//lbDMF/formularfields/formular[@formularid=$FormularID]">
<xsl:variable name="FieldName" select="@name"/> 
<xsl:variable name="TableName" select="@tablename"/>
<xsl:choose>
	<xsl:when test="@dbtype='String'">
	wxString <xsl:value-of select="@name"/>; // <xsl:value-of select="@tablename"/>
	</xsl:when>
	<xsl:when test="@dbtype='Integer'">
	int <xsl:value-of select="@name"/>; // <xsl:value-of select="@tablename"/>
	</xsl:when>
	<xsl:otherwise>
	//Unknown type <xsl:value-of select="@name"/>; // <xsl:value-of select="@tablename"/>
	</xsl:otherwise>
</xsl:choose>
</xsl:for-each>

public:
	// Relation Formulare Anwendungen
	
<xsl:for-each select="//lbDMF/formularfields/formular[@formularid=$FormularID]">
<xsl:variable name="FieldName" select="@name"/> 
<xsl:variable name="TableName" select="@tablename"/>
<xsl:variable name="PKFieldName" select="@fkname"/> 
<xsl:variable name="PKTableName" select="@fktable"/>
<xsl:variable name="FormID" select="@formularid"/>
<xsl:if test="@isfk='1'">
	<xsl:variable name="TargetFormID" select="//lbDMF/formularfields/formular[@tablename=$PKTableName][@name=$PKFieldName]/@formularid"/>
	// TargetFormID = <xsl:value-of select="$TargetFormID"/>.
	<xsl:variable name="tempTargetForm" select="//lbDMF/formulare/formular[@ID=$TargetFormID]/@name"/>
	<xsl:variable name="TargetForm">
		<xsl:call-template name="SubstringReplace">
			<xsl:with-param name="stringIn">
		<xsl:call-template name="SubstringReplace">
			<xsl:with-param name="stringIn">
		<xsl:call-template name="SubstringReplace">
			<xsl:with-param name="stringIn">
				<xsl:value-of select="$tempTargetForm"/>
			</xsl:with-param>
			<xsl:with-param name="substringIn" select="'-'"/>
			<xsl:with-param name="substringOut" select="''"/>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substringIn" select="'>'"/>
			<xsl:with-param name="substringOut" select="''"/>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substringIn" select="' '"/>
			<xsl:with-param name="substringOut" select="''"/>
		</xsl:call-template>
	</xsl:variable>

	<xsl:value-of select="$TargetForm"/>Row* Get<xsl:value-of select="$TargetForm"/>(); // <xsl:value-of select="$FieldName"/>
</xsl:if>
</xsl:for-each>
	
	bool Save();
	bool Delete();
	
	
////@@begin custom arRow
public:
////@@end custom arRow	

};
////@@end gen arRow






// Generated class for FormularID = <xsl:value-of select="$FormularID"/>
class <xsl:value-of select="$FormularName"/> : public FixedFormularBase {
public:
	<xsl:value-of select="$FormularName"/>();
	virtual ~<xsl:value-of select="$FormularName"/>();

	DECLARE_LB_UNKNOWN()

	<xsl:for-each select="//lbDMF/actionsteps/action[@what=$tempFormularName]">
	<xsl:variable name="actionid" select="@actionid"/>
	<xsl:variable name="formularid" select="//lbDMF/formularactions/action[@actionid=$actionid]/@formularid"/>
	<xsl:variable name="tempForeignFormularName" select="//lbDMF/formulare/formular[@ID=$formularid]/@name"/>
	
		<xsl:variable name="ForeignFormularName">
		<xsl:call-template name="SubstringReplace">
			<xsl:with-param name="stringIn">
		<xsl:call-template name="SubstringReplace">
			<xsl:with-param name="stringIn">
		<xsl:call-template name="SubstringReplace">
			<xsl:with-param name="stringIn">
				<xsl:value-of select="$tempForeignFormularName"/>
			</xsl:with-param>
		<xsl:with-param name="substringIn" select="'-'"/>
		<xsl:with-param name="substringOut" select="''"/>
		</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="'>'"/>
		<xsl:with-param name="substringOut" select="''"/>
		</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="' '"/>
		<xsl:with-param name="substringOut" select="''"/>
		</xsl:call-template>
		</xsl:variable>

	<xsl:variable name="ForeignAppID" select="//lbDMF/formulare/formular[@name=$tempForeignFormularName]/@applicationid"/>
	<xsl:if test="'$ForeignAppID'='$ApplicationID'">
private:
	// My AppID = <xsl:value-of select="$ApplicationID"/>
	// AppID for foreign formular = <xsl:value-of select="//lbDMF/formulare/formular[@name=$tempForeignFormularName]/@applicationid"/>
	// tempForeignFormularName = <xsl:value-of select="//lbDMF/formulare/formular[@name=$tempForeignFormularName]/@name"/>
	//
	
	<xsl:value-of select="$ForeignFormularName"/>* detailForm_<xsl:value-of select="$ForeignFormularName"/>;

	</xsl:if>


public:	
	<xsl:if test="@steptyp='4'">
	//bool LB_STDCALL updateFromMaster_<xsl:value-of select="$ForeignFormularName"/>(wxString column, wxString&amp; value);
	</xsl:if>
	<xsl:if test="@steptyp='5'">
	bool LB_STDCALL updateFromMaster_<xsl:value-of select="$ForeignFormularName"/>(wxString column, wxString&amp; value);
	</xsl:if>
	
	</xsl:for-each>
		
	<xsl:for-each select="//lbDMF/formularactions/action[@formularid=$FormularID]">
		<xsl:variable name="actionid" select="@actionid"/>
		<xsl:variable name="event" select="@event"/>
		<xsl:for-each select="//lbDMF/actionsteps/action[@actionid=$actionid]">

		<xsl:variable name="tempDetailFormularName" select="@what"/>
		<xsl:variable name="DetailFormularName">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
			<xsl:value-of select="$tempDetailFormularName"/>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="'-'"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="'>'"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="' '"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:variable>		
	
	<xsl:choose>
		<xsl:when test="@steptyp='4'">
			//<xsl:value-of select="$DetailFormularName"/>* detailForm_<xsl:value-of select="$DetailFormularName"/>;
		</xsl:when>
		<xsl:when test="@steptyp='5'">
			//<xsl:value-of select="$DetailFormularName"/>* masterForm_<xsl:value-of select="$DetailFormularName"/>;
		</xsl:when>
	</xsl:choose>
	</xsl:for-each>
	
	<xsl:variable name="EventIdentifer">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
			<xsl:value-of select="$event"/>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="'-'"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="'>'"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="' '"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:variable>

	lbErrCodes LB_STDCALL OnActionButton_<xsl:value-of select="$EventIdentifer"/>(lb_I_Unknown* uk);
	</xsl:for-each>

	<xsl:for-each select="//lbDMF/formularactions/action">
		<xsl:variable name="actionid" select="@actionid"/>
		<xsl:variable name="formularid" select="@formularid"/>
		<xsl:variable name="event" select="@event"/>
		<xsl:variable name="aID" select="//lbDMF/formulare/formular[@ID=$formularid]/@applicationid"/>
		<xsl:if test="$ApplicationID=$aID">
		<xsl:for-each select="//lbDMF/actionsteps/action[@actionid=$actionid]">
		<xsl:variable name="tempDetailFormularName" select="@what"/>
		<xsl:variable name="DetailFormularName">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
			<xsl:value-of select="$tempDetailFormularName"/>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="'-'"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="'>'"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="' '"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:variable>
	<xsl:if test="$FormularName=$DetailFormularName">
	<xsl:variable name="tempRealDetailFormularName" select="//lbDMF/formulare/formular[@ID=$formularid]/@name"/>
		<xsl:variable name="RealDetailFormularName">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
	<xsl:call-template name="SubstringReplace">
		<xsl:with-param name="stringIn">
			<xsl:value-of select="$tempRealDetailFormularName"/>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="'-'"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="'>'"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:with-param>
		<xsl:with-param name="substringIn" select="' '"/>
		<xsl:with-param name="substringOut" select="''"/>
	</xsl:call-template>
		</xsl:variable>
	<xsl:if test="@steptyp='4'">
	bool LB_STDCALL updateFromMaster_<xsl:value-of select="$RealDetailFormularName"/>(wxString column, wxString&amp; value);
	</xsl:if>
	<xsl:if test="@steptyp='5'">
	void LB_STDCALL updateFromDetail_<xsl:value-of select="$RealDetailFormularName"/>(wxString column, wxString&amp; value);
	</xsl:if>
	</xsl:if>
	</xsl:for-each>
	</xsl:if>
	</xsl:for-each>
	<xsl:for-each select="//lbDMF/formularfields/formular[@formularid=$FormularID][@isfk='1']">
	void LB_STDCALL getForeignKeyMappingData_<xsl:value-of select="@name"/>(wxChoice* choice);
	</xsl:for-each>

	void LB_STDCALL init();

	lbErrCodes LB_STDCALL registerEventHandler(lb_I_Dispatcher* dispatcher);

	lbErrCodes LB_STDCALL lbDBAdd(lb_I_Unknown* uk);

	lbErrCodes LB_STDCALL lbDBUpdate();
	lbErrCodes LB_STDCALL lbDBClear();
	lbErrCodes LB_STDCALL lbDBRead();

};
</xsl:template>

</xsl:stylesheet>