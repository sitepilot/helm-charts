{{/* -------- Name -------- */}}
{{- define "redis.name" -}}
{{- default .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* -------- Full Name -------- */}}
{{- define "redis.fullName" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* -------- Chart Name -------- */}}
{{- define "redis.chartName" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* -------- Domain -------- */}}
{{- define "redis.domain" -}}
{{- printf "%s.%s" .Release.Name .Values.ingress.rootDomain }}
{{- end }}

{{/* -------- Common Labels -------- */}}
{{- define "redis.labels" -}}
helm.sh/chart: {{ include "redis.chartName" . }}
{{ include "redis.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.sitepilot.io/name: {{ include "redis.name" . }}
app.sitepilot.io/full-name: {{ include "redis.fullName" . }}
app.sitepilot.io/chart-name: {{ include "redis.chartName" . }}
{{- end }}

{{/* -------- Selector Labels -------- */}}
{{- define "redis.selectorLabels" -}}
app.kubernetes.io/name: {{ include "redis.chartName" . }}
app.kubernetes.io/instance: {{ include "redis.name" . }}
{{- end }}

{{/* -------- Chart Name -------- */}}
{{- define "redis.chart" -}}
{{- printf "%s-%s" .Values.type .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
