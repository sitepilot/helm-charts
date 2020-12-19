{{/* -------- Name -------- */}}
{{- define "mysql.name" -}}
{{- default .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* -------- Full Name -------- */}}
{{- define "mysql.fullName" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* -------- Chart Name -------- */}}
{{- define "mysql.chartName" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* -------- Domain -------- */}}
{{- define "mysql.domain" -}}
{{- printf "%s.%s" .Release.Name .Values.ingress.rootDomain }}
{{- end }}

{{/* -------- Common Labels -------- */}}
{{- define "mysql.labels" -}}
helm.sh/chart: {{ include "mysql.chartName" . }}
{{ include "mysql.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.sitepilot.io/name: {{ include "mysql.name" . }}
app.sitepilot.io/full-name: {{ include "mysql.fullName" . }}
app.sitepilot.io/chart-name: {{ include "mysql.chartName" . }}
{{- end }}

{{/* -------- Selector Labels -------- */}}
{{- define "mysql.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mysql.chartName" . }}
app.kubernetes.io/instance: {{ include "mysql.name" . }}
{{- end }}

{{/* -------- Chart Name -------- */}}
{{- define "mysql.chart" -}}
{{- printf "%s-%s" .Values.type .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
