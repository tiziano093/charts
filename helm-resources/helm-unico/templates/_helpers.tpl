{{/* Expand the name of the chart. */}}
{{- define "helm-unico.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels */}}
{{- define "helm-unico.labels" -}}
helm.sh/chart: {{ include "helm-unico.chart" . }}
{{ include "helm-unico.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels */}}
{{- define "helm-unico.selectorLabels" -}}
app.kubernetes.io/name: {{ include "helm-unico.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


{{/* Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name. */}}
{{- define "helm-unico.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/* Create a fully qualified msmetrica name. 
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec). */}}
{{- define "helm-unico.msmetrica.fullname" -}}
{{- if .Values.msmetrica.fullnameOverride -}}
{{- .Values.msmetrica.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.msmetrica.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.msmetrica.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/* Create a fully qualified mspolicy name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec). */}}
{{- define "helm-unico.mspolicy.fullname" -}}
{{- if .Values.mspolicy.fullnameOverride -}}
{{- .Values.mspolicy.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.mspolicy.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.mspolicy.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/* Create a fully qualified servicea name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec). */}}
{{- define "helm-unico.servicea.fullname" -}}
{{- if .Values.servicea.fullnameOverride -}}
{{- .Values.servicea.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.servicea.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.servicea.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "helm-unico.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Create the name of the service account to use for msmetrica*/}}
{{- define "helm-unico.serviceAccountName.msmetrica" -}}
{{- if .Values.serviceAccounts.msmetrica.create }}
{{- default (include "helm-unico.msmetrica.fullname" .) .Values.serviceAccounts.msmetrica.name }}
{{- else }}
{{- default "default" .Values.serviceAccounts.msmetrica.name }}
{{- end }}
{{- end }}

{{/* Create the name of the service account to use for mspolicy*/}}
{{- define "helm-unico.serviceAccountName.mspolicy" -}}
{{- if .Values.serviceAccounts.mspolicy.create }}
{{- default (include "helm-unico.mspolicy.fullname" .) .Values.serviceAccounts.mspolicy.name }}
{{- else }}
{{- default "default" .Values.serviceAccounts.mspolicy.name }}
{{- end }}
{{- end }}

{{/* Create the name of the service account to use for msmetrica*/}}
{{- define "helm-unico.serviceAccountName.servicea" -}}
{{- if .Values.serviceAccounts.servicea.create }}
{{- default (include "helm-unico.servicea.fullname" .) .Values.serviceAccounts.servicea.name }}
{{- else }}
{{- default "default" .Values.serviceAccounts.msmeserviceatrica.name }}
{{- end }}
{{- end }}

