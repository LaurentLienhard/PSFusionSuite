---
external help file: PSFusionSuite-help.xml
Module Name: PSFusionSuite
online version:
schema: 2.0.0
---

# Initialize-FSEnvironment

## SYNOPSIS
Initialize a new environment for FusionSuite.

## SYNTAX

```
Initialize-FSEnvironment [[-DataBase] <String>] [[-Environment] <String>] [<CommonParameters>]
```

## DESCRIPTION
Create a new environment for FusionSuite.

## EXAMPLES

### EXAMPLE 1
```
Initialize-FSEnvironment -DataBase "MARIADB" -Environment "DEV"
```

## PARAMETERS

### -DataBase
Choose which database to use.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: MARIADB
Accept pipeline input: False
Accept wildcard characters: False
```

### -Environment
Choose wich environment to use.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: DEV
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
General notes

## RELATED LINKS
